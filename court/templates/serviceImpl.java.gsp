<%
  def varDomainName=tableNameUtil.lowerCaseFirst(tableDefine.id);
  def pkColumn=tableDefine.getPkColumn();
  def pkJavaType=tableNameUtil.getDataType(pkColumn?.columnType);
  def className=tableDefine.id;
%>package ${config.basePackage}${PubUtils.addStrAfterSeparator(config.category,"." )}.service.impl;

import ${config.basePackage}${PubUtils.addStrAfterSeparator(config.category,".")}.entity.${tableDefine.id};
import ${config.basePackage}${PubUtils.addStrAfterSeparator(config.category,".")}.mapper.${tableDefine.id}Mapper;
import ${config.basePackage}${PubUtils.addStrAfterSeparator(config.category,".")}.service.I${tableDefine.id}Service;

import cn.com.sinosoft.common.entity.QueryRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.annotation.Propagation;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;


/**
 * ${tableDefine.cnname}Manager实现类
 *
 * @author ${config.author}
 * @date ${config.nowDate}
 */
@Service
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true, rollbackFor = Exception.class)
public class ${className}ServiceImpl extends ServiceImpl<${className}Mapper, ${className}> implements I${className}Service {

	@Autowired
    private ${className}Mapper ${varDomainName}Mapper;

    @Override
    public IPage<${className}> find${className}s(QueryRequest request, ${className} ${varDomainName}) {
        LambdaQueryWrapper<${className}> queryWrapper = new LambdaQueryWrapper<>();
        // TODO 设置查询条件
        Page<${className}> page = new Page<>(request.getPageNum(), request.getPageSize());
        return this.page(page, queryWrapper);
    }

    @Override
    public List<${className}> find${className}s(${className} ${varDomainName}) {
	    LambdaQueryWrapper<${className}> queryWrapper = new LambdaQueryWrapper<>();
		// TODO 设置查询条件
		return this.baseMapper.selectList(queryWrapper);
    }

    @Override
    @Transactional
    public void create${className}(${className} ${varDomainName}) {
        this.save(${varDomainName});
    }

    @Override
    @Transactional
    public void update${className}(${className} ${varDomainName}) {
        this.saveOrUpdate(${varDomainName});
    }

    @Override
    @Transactional
    public void delete${className}(${className} ${varDomainName}) {
        LambdaQueryWrapper<${className}> wrapper = new LambdaQueryWrapper<>();
	    // TODO 设置删除条件
	    this.remove(wrapper);
	}
}
