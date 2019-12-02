<%
    def tableDefine=tableModel.tableDefine;
    def columns=tableDefine.columns;
    def pkColumn=tableDefine.getPkColumn();
    def pkJavaType=tableNameUtil.getDataType(pkColumn?.columnType);
%>package ${config.basePackage}${PubUtils.addStrAfterSeparator(config.category,"." )}.vo;


import lombok.Data;

import java.io.Serializable;
import java.util.Date;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

/**
 * ${tableDefine.cnname} VO
 *
 * @author ${config.author}
 * @date ${config.nowDate}
 */
@ApiModel(value = "${tableDefine.cnname}")
@Data
public class ${tableDefine.id}QueryVO implements Serializable{

  private static final long serialVersionUID = ${PubUtils.getRandomLong()}L;

<%
    columns.each{
            println """	@ApiModelProperty(value = "${it.cnname}")""";
            if(!it.canBeNull && "String".equals(tableNameUtil.getDataType(it.columnType))){
            	println """ @NotBlank(message = "{required}")""";
            	println """ @Size(max = ${it.length})""";
            }
            println """	private ${tableNameUtil.getDataType(it.columnType)} ${it.dataName};"""
    };

%>
}