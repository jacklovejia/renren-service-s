package io.renren.modules.sys.service;

import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;
import com.baomidou.mybatisplus.service.IService;
import io.renren.common.utils.PageUtils;
import io.renren.modules.sys.entity.SysMsgEntity;
import io.renren.modules.sys.entity.SysMsg_Log;

import java.util.List;
import java.util.Map;

/**
 * 
 *
 * @author baihe
 * @email sunlightcs@gmail.com
 * @date 2019-01-03 15:22:23
 */
public interface SysMsgService extends IService<SysMsgEntity> {

    PageUtils queryPage(Map<String, Object> params);

    Page<SysMsg_Log> testByPage(Page<SysMsg_Log> page);
}

