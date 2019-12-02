<%
    def varDomainName = tableNameUtil.lowerCaseFirst(tableDefine.id);
    def pkColumn = tableDefine.getPkColumn();
    def pkJavaType = tableNameUtil.getDataType(pkColumn?.columnType);
	def className = tableDefine.id;
%>package ${config.basePackage}${PubUtils.addStrAfterSeparator(config.category, ".")}.service;

import ${config.basePackage}${PubUtils.addStrAfterSeparator(config.category, ".")}.domain.${tableDefine.id};
import ${config.basePackage}.common.domain.QueryRequest;
import ${config.basePackage}${PubUtils.addStrAfterSeparator(config.category, ".")}.vo.${tableDefine.id}QueryVO;

import java.util.List;
import java.util.Map;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * ${tableDefine.cnname}Service接口类
 *
 * @author ${config.author}
 * @date ${config.nowDate}
 */
public interface ${className}Service extends IService<${className}> {
    /**
     * 查询（分页）
     *
     * @param request QueryRequest
     * @param ${varDomainName}VO ${tableDefine.id}QueryVO
     * @return IPage<${className}>
     */
    IPage<${className}> page(QueryRequest request, ${tableDefine.id}QueryVO ${varDomainName}VO);

    /**
     * 查询（所有）
     *
     * @param ${varDomainName} ${varDomainName}
     * @return List<${className}>
     */
    List<${className}> find(${className} ${varDomainName});

    /**
     * 新增
     *
     * @param ${varDomainName} ${varDomainName}
     */
    void create(${className} ${varDomainName});

    /**
     * 修改
     *
     * @param ${varDomainName} ${varDomainName}
     */
    void update(${className} ${varDomainName});

    /**
     * 删除
     *
     * @param ids
     */
    void delete(String[] ids);
}
