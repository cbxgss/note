# w3 sparql

网址: [https://www.w3.org/TR/sparql11-query/](https://www.w3.org/TR/sparql11-query/)

## 5 图模式

### 5.1 BGP查询

BGP是一系列三元模式

-   空节点标签
-   扩展BGP查询
    -   子图查询

## 9 Property Paths

定义: 两个节点之间的一条可能的路径

### 9.1 Property Path Syntax语法

| Syntax Form                            | Property Path Expression Name | Matches                                                      |
| -------------------------------------- | ----------------------------- | ------------------------------------------------------------ |
| `iri`                                  | PredicatePath                 | An IRI. A path of length one.                                |
| `^elt`                                 | InversePath                   | Inverse path (object to subject).                            |
| `elt1 / elt2`                          | SequencePath                  | A sequence path of `elt1` followed by `elt2`.                |
| `elt1 | elt2`                          | AlternativePath               | A alternative path of `elt1` or `elt2` (all possibilities are tried). |
| `elt*`                                 | ZeroOrMorePath                | A path that connects the subject and object of the path by zero or more matches of `elt`. |
| `elt+`                                 | OneOrMorePath                 | A path that connects the subject and object of the path by one or more matches of `elt`. |
| `elt?`                                 | ZeroOrOnePath                 | A path that connects the subject and object of the path by zero or one matches of `elt`. |
| `!iri` or `!(iri1| ...|irin)`          | NegatedPropertySet            | Negated property set. An IRI which is not one of `irii`.     `!iri`is short for `!(iri)`. |
| `!^iri` or `!(^iri1| ...|^irin)`       | NegatedPropertySet            | Negated property set where the excluded matches are based on reversed path.      That is, not one of `iri1...irin` as reverse paths.     `!^iri` is short for `!(^iri)`. |
| `!(iri1| ...|irij|^irij+1| ...|^irin)` | NegatedPropertySet            | A combination of forward and reverse properties in a negated property set. |
| `(elt)`                                |                               | A group path `elt`, brackets control precedence.             |

### 9.2 eg



## 11 聚合

## 16 查询表

### 16.1select基本形式

## 18形式定义

## 19语法定义

