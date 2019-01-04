package io.renren.common.utils;

import java.util.List;

/**
 *  短信发送工具类
 */
public class SendMsgUtil {
    /**
     * 批量短信
     * @param context
     * @param phoneNoList
     * @return
     */
    public boolean sendMsg(String context, List<String> phoneNoList){
        phoneNoList.forEach(phone->sendMsg(context,phone));
        return true;
    }
    /**
     *  普通短信
     * @param context 内容
     * @param phoneNo 手机号
     * @return
     */
    public boolean sendMsg( String context, String phoneNo){
        return true;
    }
}
