# 基本结构

```
%导言区
\documentclass{article} %book, report, letter

\usepackage{ctex} %引入中文
\newcommand\degree{^\circ} %用newcommand定义新符号

\title{\heiti QWQ}
\author{\kaishu cr}
\date{\today}

%正文区
\begin{环境名称} %document
	\maketitle
	Hello World!
	\begin{equation} %带编号的公式
		f(x)
	\end{equation}
\end{环境名称}
```

