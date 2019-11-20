<%
  def varDomainName=tableNameUtil.lowerCaseFirst(tableDefine.id);
  def serviceName=varDomainName+"Service";
  def pkColumn=tableDefine.getPkColumn();
  def pkUpperFistName=tableNameUtil.upperFirst(pkColumn?.dataName);
  def className=tableDefine.id;
%>package ${config.basePackage}${PubUtils.addStrAfterSeparator(config.category,".")}.controller;

import cn.com.sinosoft.common.annotation.ControllerEndpoint;
import cn.com.sinosoft.common.utils.FebsUtil;
import cn.com.sinosoft.common.entity.FebsConstant;
import cn.com.sinosoft.common.controller.BaseController;
import cn.com.sinosoft.common.entity.FebsResponse;
import cn.com.sinosoft.common.entity.QueryRequest;
import ${config.basePackage}${PubUtils.addStrAfterSeparator(config.category,".")}.service.I${tableDefine.id}Service;
import ${config.basePackage}${PubUtils.addStrAfterSeparator(config.category,".")}.entity.${tableDefine.id};
import com.wuwenze.poi.ExcelKit;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.util.List;
import java.util.Map;

/**
 * ${tableDefine.cnname} Controller
 *
 * @author ${config.author}
 * @date ${config.nowDate}
 */
@Slf4j
@Validated
@Controller
public class ${className}Controller extends BaseController {

    @Autowired
    private I${className}Service ${varDomainName}Service;

    @GetMapping(FebsConstant.VIEW_PREFIX + "${varDomainName}")
    public String ${varDomainName}Index(){
        return FebsUtil.view("${varDomainName}/${varDomainName}");
    }

    @GetMapping("${varDomainName}")
    @ResponseBody
    @RequiresPermissions("${varDomainName}:list")
    public FebsResponse getAll${className}s(${className} ${varDomainName}) {
        return new FebsResponse().success().data(${varDomainName}Service.find${className}s(${varDomainName}));
    }

    @GetMapping("${varDomainName}/list")
    @ResponseBody
    @RequiresPermissions("${varDomainName}:list")
    public FebsResponse ${varDomainName}List(QueryRequest request, ${className} ${varDomainName}) {
        Map<String, Object> dataTable = getDataTable(this.${varDomainName}Service.find${className}s(request, ${varDomainName}));
        return new FebsResponse().success().data(dataTable);
    }

    @ControllerEndpoint(operation = "新增${className}", exceptionMessage = "新增${className}失败")
    @PostMapping("${varDomainName}")
    @ResponseBody
    @RequiresPermissions("${varDomainName}:add")
    public FebsResponse add${className}(@Valid ${className} ${varDomainName}) {
        this.${varDomainName}Service.create${className}(${varDomainName});
        return new FebsResponse().success();
    }

    @ControllerEndpoint(operation = "删除${className}", exceptionMessage = "删除${className}失败")
    @GetMapping("${varDomainName}/delete")
    @ResponseBody
    @RequiresPermissions("${varDomainName}:delete")
    public FebsResponse delete${className}(${className} ${varDomainName}) {
        this.${varDomainName}Service.delete${className}(${varDomainName});
        return new FebsResponse().success();
    }

    @ControllerEndpoint(operation = "修改${className}", exceptionMessage = "修改${className}失败")
    @PostMapping("${varDomainName}/update")
    @ResponseBody
    @RequiresPermissions("${varDomainName}:update")
    public FebsResponse update${className}(${className} ${varDomainName}) {
        this.${varDomainName}Service.update${className}(${varDomainName});
        return new FebsResponse().success();
    }
}