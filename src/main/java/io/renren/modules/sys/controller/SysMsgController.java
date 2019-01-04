package io.renren.modules.sys.controller;

import java.util.Arrays;
import java.util.Map;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import io.renren.modules.sys.entity.SysMsgEntity;
import io.renren.modules.sys.service.SysMsgService;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;



/**
 * 
 *
 * @author baihe
 * @email sunlightcs@gmail.com
 * @date 2019-01-03 15:22:23
 */
@RestController
@RequestMapping("sys/sysmsg")
public class SysMsgController {
    @Autowired
    private SysMsgService sysMsgService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("sys:sysmsg:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = sysMsgService.queryPage(params);

        return R.ok().put("page", page);
    }

}
