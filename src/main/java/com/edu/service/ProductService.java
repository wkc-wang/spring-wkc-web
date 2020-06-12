package com.edu.service;

import java.util.List;

import com.edu.bean.Product;
import com.edu.exception.MyException;

public interface ProductService {

	List<Product> getAll();

	void save(Product product);

	Product getById(String id) throws MyException;

	void update(Product product);

	void deleteById(String id);

}
