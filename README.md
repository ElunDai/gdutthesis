# gdutthesis
广东工业大学LaTeX论文模板项目(非官方)

涵盖**毕业论文、外文参考文献翻译、优秀毕业论文**模板。

# 前言

相信我60小时的投入能节省母校学子1000+小时的时间。有了$\LaTeX​$模板再也不必花时间在繁琐的排版问题上，只需要专心把内容写好即可。

本人是19届物联网工程毕业生，所写的论文《基于Jetson开发平台的实例分割系统设计与实现》评得了本科生优秀毕业论文，所有的排版都由本项目生成。

由于$\LaTeX​$在排版控制上与Word有天壤之别，在本项目中已经尽可能得让$\LaTeX​$排出来的版面看上去像Word，（但难免还是会让看惯了Word的导师们感到不同但是又说不出哪里不对）。

# 环境要求

- Texlive2016
- xelatex
- GNU Make

# 使用步骤

## 0. 安装字体（Linux & MAC用户）

需要自行安装宋体、楷体、黑体、Times New Roman字体。

## 1. 新建论文项目

首先打开`Makefile`文件，设置项目名称。

```Makefile
THESIS = thesis
```

如此便设置了`thesis.tex`为主文件。注：项目名称本身不带后缀。



然后建立工程目录结构。使用以下命令：

```shell
make init
```

该命令会将template模板目录结构复制到根目录中。

若项目名称为以下三者之一：

- thesis: 毕业论文
- translate: 外文参考文献翻译
- excellent: 优秀毕业论文

则会将它们对应的`tex`文件模板也复制到根目录下

## 2. 修改配置文件

打开`configuration.cfg`，在里面写论文相关的信息、指定bib和图片目录以及引入所需要的其他包。

## 3. 编写内容

详细使用方法见本项目WIKI。

### 毕业论文

无需要修改`thesis.tex`文件，只需要修改`tex/`目录下的子文件即可。

- 摘要：`tex/abstract`
- 绪论：`tex/introduction`
- 正文：`tex/body`
- 结论：`tex/conclusion`
- 致谢：`tex/thanks`
- 附录：`tex/appendix`

### 外文参考文献翻译

打开`translate.tex`设置原文pdf路径

```latex
\includepdf[pages=-]{path/to/paper.pdf} % 在此处输入原文pdf路径
```

编写摘要和翻译正文

- 摘要：`tex/translate-abstract`
- 翻译正文：`tex/translate-body`

### 优秀毕业论文

无需要修改`excellent.tex`文件，只需要修改`tex/`目录下的子文件即可。

- 中文摘要：`excellent-abstract_zh.tex`
- 导师评语：`excellent-comment.tex`
- 中文正文：`excellent-body.tex`
- 参考文献：`excellent-comment.tex`
- 英文摘要：`excellent-abstract_en.tex`
- 英文正文：`excellent-bodyen.tex`

## 4. 编译出PDF

字数统计

```shell
make wordcount
```

编译

```shell
make
```

> 注：由于LaTeX的编译机制需要反复编译来解决BIB、交叉引用、目录页码更新等问题。本项目使用了Make来控制依赖，减少重复编译。解决方案是使用`_need_latex`和`_need_bibtex`标记文件实现，但是有时会误判需要编译的时候为已经无需再编译，此时可以使用以下命令来强制编译
>
> ```shell
> make compulsory
> make compulsory view
> ```

编译并查看PDF

```shell
make view
```

清理编译输出文件

```shell
make clean
```

编译示例

```shell
cd example
make THESIS=example
make THESIS=translate
make THESIS=excellent
```



# 与样张区别之处

| 项目   | gdutthesis                                                   | 样张                                                         | 手册要求                                               |
| ------ | ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------ |
| 页边距 | 同手册要求                                                   | 左右两侧边距相同                                             | 上边距:30mm;下边距:25mm;<br />左边距:30mm;右边距:20mm; |
| 封面   | 居中                                                         | 未居中                                                       |                                                        |
| 字间距 | 同手册要求                                                   | 英文摘要与中文摘要行间距都不同                               | 1.5倍行距                                              |
| 字体   | 同手册要求                                                   | 在章节标题中的英文是黑体                                     | 数字和字母: Times New Roman 体                         |
| 目录   | 缩进统一<br />目录二字中间两个空格与摘要、致谢等保持一致<br />标题的段后距离与其他地方一致 | 缩进混乱<br />目录二字中间有四个空格，与其他地方不一致<br />标题的段后距离太窄，与其他地方不一致 |                                                        |
| 公式   | 居中                                                         | 左对齐                                                       |                                                        |
| 条和款 | 条和款都设置为1.5倍行距                                      | 款间距比条还大                                               |                                                        |

# TODOLIST

- [ ] “节”、“条”的段前、段后各设为 0.5 行。（貌似没有办法小于\baselineskip）
- [x] 生成的参考文献中`\url`字体设置为Times New Roman
- [ ] BUG: \MakeUppercase更改后若恢复原始内容则`参考文献`四个字无法加入目录的神奇问题
