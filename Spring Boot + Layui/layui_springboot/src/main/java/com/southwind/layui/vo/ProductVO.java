package com.southwind.layui.vo;

import lombok.Data;

@Data
public class ProductVO {
    private Integer id;
    private String name;
    private String description;
    private Float price;
    private Integer stock;
    private String categorylevelone;
    private String categoryleveltwo;
    private String categorylevelthree;
    private String fileName;
}
