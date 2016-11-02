package com.ning.services;

/**
 * Created by ning on 10/18/16.
 */
public interface KafkaService {
    /**
     * 发消息
     * @param topic 主题
     * @param obj 发送内容
     */
    public void sendUserInfo(String topic, Object obj);
}
