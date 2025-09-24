package com.ssm.po;

import java.util.Date;

public class Product {
    private Integer id;

    private String name;

    private String icon;

    private String price;

    public Integer getId() {
        return id;
    }

    public Product() {
    }

    public Product(Integer id, String name, String icon, String price) {
        this.id = id;
        this.name = name;
        this.icon = icon;
        this.price = price;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }
}
