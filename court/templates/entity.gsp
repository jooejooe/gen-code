<%
    def tableDefine=tableModel.tableDefine;
    def columns=tableDefine.columns;
    def pkColumn=tableDefine.getPkColumn();
    def pkJavaType=tableNameUtil.getDataType(pkColumn?.columnType);
%>package ${config.basePackage}${PubUtils.addStrAfterSeparator(config.category,"." )}.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.wuwenze.poi.annotation.Excel;
import com.wuwenze.poi.annotation.ExcelField;

import cn.com.sinosoft.common.converter.TimeConverter;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;
import java.io.Serializable;
import java.util.Date;

/**
 * ${tableDefine.cnname} mybatisPlus实体bean
 *
 * @author ${config.author}
 * @date ${config.nowDate}
 */
@TableName("${tableDefine.dbTableName}")
@Data
public class ${tableDefine.id} implements Serializable{

  private static final long serialVersionUID = ${PubUtils.getRandomLong()}L;

<% if(pkColumn!=null) { %>
    @TableId(value = "${pkColumn.columnName}", type = IdType.AUTO)
    private ${pkJavaType} ${pkColumn.dataName};
<%}%>
<%
    columns.each{
        if(!it.getIsPK()) {
            println """	/**  ${it.cnname}  */""";
            println """ @TableField(value="${it.columnName}")""";
            println """	private ${tableNameUtil.getDataType(it.columnType)} ${it.dataName};"""
        }
    };

%>
}