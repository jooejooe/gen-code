<%
  def varDomainName=tableNameUtil.lowerCaseFirst(tableDefine.id);
  def pkColumn=tableDefine.getPkColumn();
  def pkJavaType=tableNameUtil.getDataType(pkColumn?.columnType);
  def className=tableDefine.id;
%>package ${config.basePackage}${PubUtils.addStrAfterSeparator(config.category,"." )}.service.impl;

import ${config.basePackage}${PubUtils.addStrAfterSeparator(config.category,".")}.domain.${tableDefine.id};
import ${config.basePackage}${PubUtils.addStrAfterSeparator(config.category,".")}.dao.${tableDefine.id}Mapper;
import ${config.basePackage}${PubUtils.addStrAfterSeparator(config.category,".")}.service.${tableDefine.id}Service;
import ${config.basePackage}${PubUtils.addStrAfterSeparator(config.category, ".")}.vo.${tableDefine.id}QueryVO;
import ${config.basePackage}.common.utils.SortUtil;
import ${config.basePackage}.common.domain.QueryRequest;
import ${config.basePackage}.common.domain.FebsConstant;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import lombok.extern.slf4j.Slf4j;

/**
 * ${tableDefine.cnname}Manager实现类
 *
 * @author ${config.author}
 * @date ${config.nowDate}
 */
@Slf4j
@Service
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true, rollbackFor = Exception.class)
public class ${className}ServiceImpl extends ServiceImpl<${className}Mapper, ${className}> implements ${className}Service {

	@Autowired
    private ${className}Mapper ${varDomainName}Mapper;

    @Override
    public IPage<${className}> page(QueryRequest request, ${tableDefine.id}QueryVO ${varDomainName}VO) {
        LambdaQueryWrapper<${className}> queryWrapper = new LambdaQueryWrapper<>();
        // TODO 设置查询条件
        Page<Params> page = new Page<>();
    	SortUtil.handlePageSort(request, page, "createTime", FebsConstant.ORDER_DESC, false);
        return this.page(page, queryWrapper);
    }

    @Override
    public List<${className}> find(${className} ${varDomainName}) {
	    LambdaQueryWrapper<${className}> queryWrapper = new LambdaQueryWrapper<>();
		// TODO 设置查询条件
		return this.baseMapper.selectList(queryWrapper);
    }

    @Override
    @Transactional
    public void create(${className} ${varDomainName}) {
        this.save(${varDomainName});
    }

    @Override
    @Transactional
    public void update(${className} ${varDomainName}) {
        this.saveOrUpdate(${varDomainName});
    }

    @Override
    @Transactional
    public void delete(String[] ids) {
        LambdaQueryWrapper<${className}> wrapper = new LambdaQueryWrapper<>();
	    // TODO 设置删除条件
	    this.remove(wrapper);
	}
}
