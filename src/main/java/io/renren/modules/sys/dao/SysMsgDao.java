package io.renren.modules.sys.dao;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;
import io.renren.modules.sys.entity.SysMsgEntity;
import io.renren.modules.sys.entity.SysMsg_Log;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * 
 * 
 * @author baihe
 * @email sunlightcs@gmail.com
 * @date 2019-01-03 15:22:23
 */
@Mapper
public interface SysMsgDao extends BaseMapper<SysMsgEntity> {
	List<SysMsg_Log> testByPage(Pagination page);
}
