package com.d3charts1.myjavaservice.bean;
import java.util.ArrayList;
import java.util.List;

/**
 * Created with IntelliJ IDEA
 * Created By Kinsey
 * Date: 2017/9/8
 * Time: 14:01
 */
public class Children {
    private String name;
    private List<Children> children=new ArrayList<Children>();
    public void setChildren(List<Children> children) {
        this.children = children;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getName() {
        return name;
    }
    public List<Children> getChildren() {
        return children;
    }
}
