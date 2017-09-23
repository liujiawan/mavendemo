import com.d3charts1.myjavaservice.bean.Children;
import net.sf.json.JSONObject;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA
 * Created By Kinsey
 * Date: 2017/9/8
 * Time: 14:00
 */
public class Test {
    public static void main(String[] args){
        Map map=getJson();
        System.out.print(map);

    }
    public static Map getJson(){
        List<Children> list=new ArrayList<Children>();
        Children children=new Children();
        children.setName("首页");
        for(int i=0;i<4;i++){
            Children children1=new Children();
            children1.setName(i+"张三");
            list.add(children1);
        }
        children.setChildren(list);
        for(int j=0;j<list.size();j++){
            if(j!=3){
                List<Children> list1=new ArrayList<Children>();
                Children children1=new Children();
                children1.setName(j+"李四");
                list1.add(children1);
                list.get(j).setChildren(list1);
            }

        }
        JSONObject jsonObject=JSONObject.fromObject(children);
        Map map=new HashMap();
        map.put("ret",jsonObject);
        map.put("msg","succcess");
        return map;
    }
}
