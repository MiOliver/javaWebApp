package com.ning.serviceimpl;

import com.ning.services.KafkaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.integration.kafka.support.KafkaHeaders;
import org.springframework.integration.support.MessageBuilder;
import org.springframework.messaging.MessageChannel;
import org.springframework.stereotype.Service;

/**
 * Created by ning on 10/18/16.
 */

@Service("kafkaService")
public class KafkaServiceImpl  implements KafkaService {

    @Autowired
    @Qualifier("kafkaTopicTest")
    private MessageChannel channel;


    /**
     *  类KafkaServiceImpl.java的实现描述：发消息实现类
     * @param topic 主题
     * @param obj 发送内容
     */
    public void sendUserInfo(String topic, Object obj) {
        channel.send(MessageBuilder.withPayload(obj)
                .setHeader(KafkaHeaders.TOPIC,topic)
                .build());
    }

}
