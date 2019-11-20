<%
    def varDomainName=tableNameUtil.lowerCaseFirst(tableDefine.id);
    def pkColumn=tableDefine.getPkColumn();
    def pkJavaType=tableNameUtil.getDataType(pkColumn?.columnType);
%>package ${config.basePackage}${PubUtils.addStrAfterSeparator(config.category,"." )}.mapper;

import ${config.basePackage}${PubUtils.addStrAfterSeparator(config.category,"." )}.entity.${tableDefine.id};
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

/**
 * ${tableDefine.cnname} mybatisPlus数据访问接口
 *
 * @author ${config.author}
 * @date ${config.nowDate}
 */
public interface ${tableDefine.id}Mapper extends BaseMapper<${tableDefine.id}> {

}
