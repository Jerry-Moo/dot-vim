`coc-extensions` 目录下的所有 js 文件都会被 coc 当作插件加载，暂时无法支持 package.json 配置。

例如我们想请求 lbdbq 里面的 email 列表用来做 email 补全。

首先找到配置的根目录，使用命令 `:echo coc#util#get_config_home()`, 通常结果是 `~/.vim`， 在该目录下执行 `mkdir coc-extensions && touch address.js` 创建 `coc-extensions` 文件夹以及 `address.js` 文件。

在 `address.js` 文件内加入：

```javascript
const { sources } = require("coc.nvim");
const { spawn } = require("child_process");
const readline = require("readline");

exports.activate = async context => {
  context.subscriptions.push(
    sources.createSource({
      // 唯一 id
      name: "notmuch",
      // 用于 menu
      shortcut: "address",
      // 指定 filetype
      filetypes: ["mail"],
      // 仅在触发条件满足时触发
      triggerOnly: true,
      priority: 99,
      triggerPatterns: [
        /^(Bcc|Cc|From|Reply-To|To):\s*/,
        /^(Bcc|Cc|From|Reply-To|To):.*,\s*/
      ],
      doComplete: async function(opt) {
        let matches = await getAddresses(opt.input);
        return {
          items: matches.map(m => {
            return {
              word: `${m[1]} <${m[0]}>`,
              abbr: `${m[0]} ${m[1]}`,
              filterText: `${m[0]} ${m[1]}`,
              menu: this.menu
            };
          })
        };
      }
    })
  );
};

async function getAddresses(input) {
  let result = [];
  return new Promise((resolve, reject) => {
    const p = spawn("lbdbq", [input]);
    const rl = readline.createInterface(p.stdout);
    p.on("error", reject);
    rl.on("line", line => {
      if (line.startsWith("lbdbq:")) return;
      let [email, name] = line.split("\t");
      result.push([email, name]);
    });
    rl.on("close", () => {
      resolve(result);
    });
  });
}
```
