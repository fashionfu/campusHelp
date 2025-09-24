package com.ssm.service;

import com.ssm.po.Product;
import com.ssm.po.School;

import java.util.List;

public interface ProductService {
	public List<Product> getAll();

	public Product getById(Integer id);

	public int update(Product product);

	public int delete(Integer id);

	public int add(Product product);

}
