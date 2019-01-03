package io.renren.modules.job;

import io.renren.common.aspect.ControllerAspect;
import org.apache.commons.logging.LogFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class Test {

    private Logger logger = LoggerFactory.getLogger(ControllerAspect.class);

//    @Scheduled(cron = "0 0/5 * * * *")
    public void aa(){
        int a = 10/0;
    }

//    @Scheduled(cron = "0 0/4 * * * *")
    public void ab(){
        try{
            int a = 10/0;
        }catch (Exception e){
            logger.error(e.getMessage());
        }

    }
}
