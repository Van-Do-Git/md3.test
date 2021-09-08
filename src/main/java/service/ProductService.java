package service;

import config.ConnectionJDBC;
import model.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductService {
    private static final String SELECT_ALL = "select * from product join category on product.category = category.id;";
    private static final String SELECT_ALL_CATE = "select * from category";
    private static final String INSERT_PRODUCT = "insert into product(name_pr, price, quantity, color, description, category) VALUE (?,?,?,?,?,?);";
    private static final String DELETE = "delete from product where id_pr = ?;";
    private static final String SELECT_BY_ID = "select * from product join category on product.category = category.id where id_pr=?;";
    private static final String UPDATE_PRODUCT = "update product set name_pr=?, price=?,quantity=?,color=?,description=?,category=? where id_pr=?;";
    private static final String SELECT_BY_NAME = "select * from product join category on product.category = category.id where name_pr=?;";
    Connection connection = ConnectionJDBC.getConnection();

    public List<Product> selectAll() {
        List<Product> list = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id_pr");
                String name = resultSet.getString("name_pr");
                int price = resultSet.getInt("price");
                int quantity = resultSet.getInt("quantity");
                String color = resultSet.getString("color");
                String description = resultSet.getString("description");
                String category = resultSet.getString("name");
                list.add(new Product(id, name, price, quantity, color, description, category));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<String> selectCate() {
        List<String> list = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement(SELECT_ALL_CATE);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                String category = resultSet.getString("name");
                list.add(category);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public void save(Product product) {
        int id_cate;
        if (product.getCategory() == "phone") {
            id_cate = 1;
        } else {
            id_cate = 2;
        }
        try {
            PreparedStatement statement = connection.prepareStatement(INSERT_PRODUCT);
            statement.setString(1, product.getName());
            statement.setInt(2, product.getPrice());
            statement.setInt(3, product.getQuantity());
            statement.setString(4, product.getColor());
            statement.setString(5, product.getDescription());
            statement.setInt(6, id_cate);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void delete(int id) {
        try {
            PreparedStatement statement = connection.prepareStatement(DELETE);
            statement.setInt(1, id);
            statement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    public Product findByID(int id) {
        Product product = null;
        try {
            PreparedStatement statement = connection.prepareStatement(SELECT_BY_ID);
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                String name = resultSet.getString("name_pr");
                int price = resultSet.getInt("price");
                int quantity = resultSet.getInt("quantity");
                String color = resultSet.getString("color");
                String description = resultSet.getString("description");
                String category = resultSet.getString("name");
                product = new Product(name, price, quantity, color, description, category);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return product;
    }

    public void update(Product product) {
        int id_cate;
        if (product.getCategory() == "phone") {
            id_cate = 1;
        } else {
            id_cate = 2;
        }
        try {
            PreparedStatement statement = connection.prepareStatement(UPDATE_PRODUCT);
            statement.setString(1, product.getName());
            statement.setInt(2, product.getPrice());
            statement.setInt(3, product.getQuantity());
            statement.setString(4, product.getColor());
            statement.setString(5, product.getDescription());
            statement.setInt(6, id_cate);
            statement.setInt(7, product.getId());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Product> selectByName(String name) {
        List<Product> list = new ArrayList<>();

        try {
            PreparedStatement statement = connection.prepareStatement(SELECT_BY_NAME);
            statement.setString(1,name);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id_pr");
                int price = resultSet.getInt("price");
                int quantity = resultSet.getInt("quantity");
                String color = resultSet.getString("color");
                String description = resultSet.getString("description");
                String category = resultSet.getString("name");
                list.add(new Product(id, name, price, quantity, color, description, category));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return list;
    }
}
