<%

 def columns=tableDefine.columns;
 def mapName=tableDefine.id+"-Map";
 def cnt=0;
 def pkColumn=tableDefine.getPkColumn();
 def pkJavaType=tableNameUtil.getFullDataType(pkColumn?.columnType);
 Set updateExcludes = ["id","creator","created","modified","concurrentVersion"]
%><?xml version="1.0" encoding="UTF-8" ?> 
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" 
"http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="${config.basePackage}${PubUtils.addStrAfterSeparator(config.category,"." )}.mapper.${tableDefine.id}Mapper">

  <resultMap id="${tableDefine.id}" type="${config.basePackage}${PubUtils.addStrAfterSeparator(config.category,".")}.entity.${tableDefine.id}">
 <%
     def columnNames=[];
     def dataNames=[];
 	  columns.each{
		  println """		<id property="${it.dataName}" column="${it.columnName}"/>""";
			if(it.getIsPK()){
				if(extendConf["autoKey"]!="true"){
					dataNames.add(it.dataName);
					columnNames.add(it.columnName);
				}
			}else{
					dataNames.add(it.dataName);
					columnNames.add(it.columnName);
			}


}%>
	</resultMap>
</mapper>