package com.ssm.service.impl;

import com.ssm.mapper.ProductMapper;
import com.ssm.mapper.ProductMapper;
import com.ssm.po.Product;
import com.ssm.service.ProductService;
import com.ssm.service.ProductService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;


@Service("productService")
public class ProductServiceImpl implements ProductService {

	@Resource(name="productMapper")
	private ProductMapper productMapper;

	@Override
	public List<Product> getAll() {
		return productMapper.selectAll();
	}

	@Override
	public Product getById(Integer id) {
		return productMapper.selectByPrimaryKey(id);
	}

	@Override
	public int update(Product product) {
		return productMapper.updateByPrimaryKeySelective(product);
	}


	@Override
	public int delete(Integer id) {

		return productMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int add(Product product) {
		return productMapper.insert(product);
	}


}
