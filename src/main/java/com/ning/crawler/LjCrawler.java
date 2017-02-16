package com.ning.crawler;

import com.ning.dao.HouseRecord;
import com.ning.domain.BlogCategory;
import com.ning.mapper.BlogCategoryMapper;
import com.ning.mapper.HouseRecordMapper;
import com.ning.utils.SpringBeanFactoryUtils;
import edu.uci.ics.crawler4j.crawler.Page;
import edu.uci.ics.crawler4j.crawler.WebCrawler;
import edu.uci.ics.crawler4j.parser.HtmlParseData;
import edu.uci.ics.crawler4j.url.WebURL;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import java.math.BigDecimal;
import java.util.Date;
import java.util.regex.Pattern;

/**
 * Created by oliver on 2017/2/16.
 */
public class LjCrawler extends WebCrawler {

    private static final Logger logger= LoggerFactory.getLogger(LjCrawler.class);

    private final static Pattern FILTERS = Pattern.compile(".*(\\.(css|js|gif|jpg"
            + "|png|mp3|mp3|zip|gz))$");

    @Autowired
    private BlogCategoryMapper blogCategoryMapper;

    private HouseRecordMapper houseRecordMapper;

    public LjCrawler() {
        houseRecordMapper =SpringBeanFactoryUtils.getApplicationContext().getBean(HouseRecordMapper.class);
    }

    @Override
    public boolean shouldVisit(Page referringPage, WebURL url) {
        String href = url.getURL().toLowerCase();
        return !FILTERS.matcher(href).matches()
                && href.startsWith("http://qd.lianjia.com");
    }

    @Override
    public void visit(Page page) {
        String url = page.getWebURL().getURL();
        logger.info("URL: " + url);
        if (page.getParseData() instanceof HtmlParseData) {
            HtmlParseData htmlParseData = (HtmlParseData) page.getParseData();
            String html = htmlParseData.getHtml();
            Document document= Jsoup.parse(html);
            Elements elements= document.body().getElementsByClass("sellListContent");
            for(Element e:elements){
                HouseRecord record=new HouseRecord();
                Elements info= e.getElementsByClass("clear").get(1).getAllElements();
                System.out.println("--------------------------------------");
                for(Element infoItem:info){

                    switch (infoItem.className()){
                        case "title":
                            System.out.println("title:"+infoItem.getElementsByClass("title").get(0).text());
                            record.setTitle(infoItem.getElementsByClass("title").get(0).text());
                            break;
                        case "address":
                            System.out.println("address:"+infoItem.getElementsByClass("houseInfo").last().text());
                            record.setAddress(infoItem.getElementsByClass("houseInfo").last().text());
                            break;
                        case "flood":
                            String desc=infoItem.getElementsByClass("flood").first().child(0).ownText();
                            System.out.println("desc:"+infoItem.getElementsByClass("flood").first().child(0).ownText());
                            String area=infoItem.getElementsByClass("flood").first().child(0).child(1).text();
                            System.out.println("area:"+infoItem.getElementsByClass("flood").first().child(0).child(1).text());
                            record.setDescri(desc);
                            record.setArea(area);
                            break;
                        case "followInfo":
                            System.out.println("followInfo:"+infoItem.getElementsByClass("followInfo").text());
                            record.setFollowInfo(infoItem.getElementsByClass("followInfo").text());
                            break;
                        case "tag":
                            System.out.println("tag:"+infoItem.getElementsByClass("tag").text());
                            record.setDescri(infoItem.getElementsByClass("tag").text());
                            break;
                        case "priceInfo":
                            Elements price=infoItem.getElementsByClass("priceInfo");
                            String totlePrice=price.get(0).child(0).text().replaceAll("\\D+","");
                            record.setPrice(new BigDecimal(totlePrice));
                            System.out.println("priceInfo:"+totlePrice);
                            String unitPrice=price.get(0).child(1).text().replaceAll("\\D+","");
                            System.out.println("unitPrice:"+price.get(0).child(1).text().replaceAll("\\D+",""));
                            record.setUnitPrice(new BigDecimal(unitPrice));
                            break;
                        default:
                            break;
                    }
                }
                record.setCreateTime(new Date());
                record.setCreatePerson("Machine");
                if(houseRecordMapper.countByTitle(record.getTitle())==0){
                    houseRecordMapper.insert(record);
                    logger.info("insert one record ");
                }else{
                    logger.info("insert no record ");
                }

            }
        }
    }
}
