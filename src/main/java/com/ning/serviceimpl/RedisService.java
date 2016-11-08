package com.ning.serviceimpl;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.ning.utils.SerializeUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.data.redis.connection.RedisConnection;
import org.springframework.data.redis.core.*;
import org.springframework.data.redis.serializer.RedisSerializer;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * Created by ning on 9/14/16.
 */
@Service
public class RedisService {
    @Autowired
    private RedisTemplate<String,String> template;  //注意泛型的类型设置，否则导致存储数据的格式问题。

    @Autowired
    private RedisTemplate<String,String> templateString;

    @Resource(name="redisTemplate")
    private ListOperations<String,String> listOps;

    @Resource(name="redisTemplate")
    private HashOperations<String,String,String> hashOps;

    private static String HASHKEY="hashtest";


    public void addLink(String userId,String url){
        /**不指定redis key名字，使用本机用户名 */
        listOps.leftPush(userId,url);
    }

    public List<String> getLink(final String userId){
        /**不指定redis key名字，使用本机用户名 */
        final List<String> returnValue= Lists.newArrayList();
        final byte[] key=userId.getBytes();
        template.execute(new RedisCallback<Object>() {
            @Override
            public Object doInRedis(RedisConnection redisConnection) throws DataAccessException {

                List<byte[]> valueList=redisConnection.lRange(key,0l,5l);
                for(byte[] item:valueList){
                    String itemStr=SerializeUtil.unserialize(item).toString();
                    System.out.println(itemStr);
                    returnValue.add(itemStr);
                }
                return returnValue;
            }

        });
        return returnValue;
    }

    public void append(final String key,String param) {
        /**不指定redis key名字，使用本机用户名 */
        long result;
        final byte[] addBytes = param.getBytes();
        template.opsForValue().append(key,param);
    }


    public String getString(final String key){
        /**不指定redis key名字，使用本机用户名 */
//        byte[] keyBytes=key.getBytes();
        String result=templateString.opsForValue().get(key);
        return result;
    }



    /**add hash*/
    public boolean addHash(String key,String value){
        RedisSerializer redisSerializer=template.getHashKeySerializer();
        template.boundHashOps(HASHKEY).put(key,value);
        template.opsForHash().put(HASHKEY,key,value);
        return true;
    }

    public boolean setHash(String key,String value){
        RedisSerializer redisSerializer=template.getHashKeySerializer();
        template.boundHashOps(HASHKEY).put(key,value);
        return true;
    }

    /**
     * get all hashmap
     * @return
     */
    public Map<String,Object> getHash(){
        Map<String,Object> allhash= Maps.newHashMap();
        BoundHashOperations<String,String,Object> boundHashOperations =null;
        RedisSerializer redisSerializer=template.getHashKeySerializer();
        boundHashOperations= template.boundHashOps(HASHKEY);
        allhash=boundHashOperations.entries();
        return allhash;
    }





}
