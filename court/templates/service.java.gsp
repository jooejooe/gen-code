<%
    def varDomainName = tableNameUtil.lowerCaseFirst(tableDefine.id);
    def pkColumn = tableDefine.getPkColumn();
    def pkJavaType = tableNameUtil.getDataType(pkColumn?.columnType);
	def className = tableDefine.id;
%>package ${config.basePackage}${PubUtils.addStrAfterSeparator(config.category, ".")}.service;

import ${config.basePackage}${PubUtils.addStrAfterSeparator(config.category, ".")}.entity.${tableDefine.id};

import cn.com.sinosoft.common.entity.QueryRequest;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * ${tableDefine.cnname}Service接口类
 *
 * @author ${config.author}
 * @date ${config.nowDate}
 */
public interface I${className}Service extends IService<${className}> {
    /**
     * 查询（分页）
     *
     * @param request QueryRequest
     * @param ${varDomainName} ${varDomainName}
     * @return IPage<${className}>
     */
    IPage<${className}> find${className}s(QueryRequest request, ${className} ${varDomainName});

    /**
     * 查询（所有）
     *
     * @param ${varDomainName} ${varDomainName}
     * @return List<${className}>
     */
    List<${className}> find${className}s(${className} ${varDomainName});

    /**
     * 新增
     *
     * @param ${varDomainName} ${varDomainName}
     */
    void create${className}(${className} ${varDomainName});

    /**
     * 修改
     *
     * @param ${varDomainName} ${varDomainName}
     */
    void update${className}(${className} ${varDomainName});

    /**
     * 删除
     *
     * @param ${varDomainName} ${varDomainName}
     */
    void delete${className}(${className} ${varDomainName});
}
