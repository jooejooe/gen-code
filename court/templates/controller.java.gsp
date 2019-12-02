<%
  def varDomainName=tableNameUtil.lowerCaseFirst(tableDefine.id);
  def serviceName=varDomainName+"Service";
  def pkColumn=tableDefine.getPkColumn();
  def pkUpperFistName=tableNameUtil.upperFirst(pkColumn?.dataName);
  def className=tableDefine.id;
%>package ${config.basePackage}${PubUtils.addStrAfterSeparator(config.category,".")}.controller;

import ${config.basePackage}.common.controller.BaseController;
import ${config.basePackage}.common.domain.PageVO;
import ${config.basePackage}.common.domain.QueryRequest;
import ${config.basePackage}${PubUtils.addStrAfterSeparator(config.category,".")}.service.${tableDefine.id}Service;
import ${config.basePackage}${PubUtils.addStrAfterSeparator(config.category,".")}.domain.${tableDefine.id};
import ${config.basePackage}${PubUtils.addStrAfterSeparator(config.category,".")}.vo.ParamsQueryVO;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;

import com.baomidou.mybatisplus.core.toolkit.StringPool;
import com.baomidou.mybatisplus.extension.api.R;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

/**
 * ${tableDefine.cnname} Controller
 *
 * @author ${config.author}
 * @date ${config.nowDate}
 */
@Slf4j
@RestController
public class ${className}Controller extends BaseController {

    @Autowired
    private ${className}Service ${varDomainName}Service;



	/**
	 * 分页列表
	 * @param request QueryRequest
	 * @param params
	 * @return
	 */
	@ApiOperation(value = "获取${tableDefine.cnname}列表", notes = "获取${tableDefine.cnname}列表")
	@GetMapping
	public PageVO pageList(QueryRequest request, ${className}QueryVO ${varDomainName}QueryVO){
		PageVO<${className}> page = (PageVO<${className}>) getDataTable(${varDomainName}Service.page(request, ${varDomainName}QueryVO));
		return page;
	}
	
	
	/**
	 * 
	 * @param params
	 * @return
	 */
	@ApiOperation(value = "添加${tableDefine.cnname}", notes = "添加${tableDefine.cnname}")
	@PostMapping
	public R add(@RequestBody ${className} ${varDomainName}){
		this.${varDomainName}Service.create(${varDomainName});
		return success("新增${tableDefine.cnname}成功！");
	}
	
	/**
	 * 
	 * @param ids
	 * @return
	 */
	@ApiOperation(value = "批量删除参数", notes = "批量删除参数")
	@ApiImplicitParams({
			@ApiImplicitParam(name = "ids", value = "参数ids", required = true, paramType = "path", dataType = "String"), })
	@DeleteMapping("/{ids}")
	public R<Object> delete(@PathVariable String ids) {
		String[] pids = ids.split(StringPool.COMMA);
		this.${varDomainName}Service.delete(pids);
		return success("删除${tableDefine.cnname}成功！");
	}
	/**
	 * 
	 * @param params
	 * @return
	 */
	@ApiOperation(value = "更新${tableDefine.cnname}", notes = "更新${tableDefine.cnname}")
	@PutMapping("/{id}")
	public R<Object> update(@RequestBody ${className} ${varDomainName}){
		this.${varDomainName}Service.update(${varDomainName});
		return success("修改${tableDefine.cnname}信息成功！");
	}
	/**
	 * 
	 * @param id
	 * @return
	 */
	@ApiOperation(value = "更新${tableDefine.cnname}", notes = "更新${tableDefine.cnname}")
	@GetMapping("/{id}")
	public R<Object> getById(@PathVariable String id){
		this.${varDomainName}Service.getById(id);
		return success("获取${tableDefine.cnname}信息成功！");
	}
}