package io.renren.modules.sys.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;
import io.renren.modules.sys.dao.SysMsgDao;
import io.renren.modules.sys.entity.SysMsgEntity;
import io.renren.modules.sys.entity.SysMsg_Log;
import io.renren.modules.sys.service.SysMsgService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Map;


@Service("sysMsgService")
public class SysMsgServiceImpl extends ServiceImpl<SysMsgDao, SysMsgEntity> implements SysMsgService {

//    @Autowired
//    private SysMsgDao sysMsgDao;

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
            String phoneNo = (String)params.get("phoneNo");
        Page<SysMsgEntity> page = this.selectPage(
                new Query<SysMsgEntity>(params).getPage(),
                new EntityWrapper<SysMsgEntity>()
                        .eq(!"".equals(phoneNo),"phone_no",phoneNo)
        );

        return new PageUtils(page);
    }

    @Override
    public Page<SysMsg_Log> testByPage(Page<SysMsg_Log> page) {
//        return page.setRecords(sysMsgDao.testByPage(page));
        return page.setRecords(this.baseMapper.testByPage(page));
    }

}
