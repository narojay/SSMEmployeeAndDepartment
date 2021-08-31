## 新增sql数据库文件 
com.hjsjy.crud.sql包中，需要的可以自己导入到数据库中
<br>
# SSMEmployeeAndDepartMent 遇到的一些BUG解决办法和项目经验总结
## spring单元测试
> 报错原因是因为spring版本的冲突,遇到错的兄弟可以看下自己的maven 目录下所有的 org.spring下的jar包是不是版本都一样，一定要一样，尤其时*spring-test* >.

## 数据库重新自增(两个解决方法)
> 方法①   USE 数据库名; DELETE FROM 表名 ALTER TABLE 表名 auto_increment = 1;
> 方法②USE 数据库名; TRUNCATE TABLE 表名;

## 数据库插入中文数据数据显示
> 解决办法:url后面加上这个 ?characterEncoding=utf-8.

## 路径问题 
> 要先将webapp mark as resources(idea).

## setAttribute报错
> 可能是 jsp-api没加入maven.

## 写jquery调用方法的时候尽量先写分号要不然很容易忘，出错也很难查找。

## 数据校验很重要
> 前端校验 后端校验 数据库校验.
> jquery 前端校验。ajax用户名重复校验 后端校验(JRS303 ).

## 分页排序问题
> 看看是不是 mapper.xml下 动态sql的 order by XX 没有执行.

2019.10.30更新 这是自己当时第一次跟着B站敲的java项目最后也跑起来了，如果有问题请见谅。
