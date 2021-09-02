package example.model;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import example.pojo.Cart;
import example.pojo.Login;
import example.pojo.Product;
import example.pojo.User;

@Repository
@Transactional
public class UserDAO {
	
	@Autowired
	SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	public int saveData(Login l, User u) {
		l.setUser(u);
		int status1 = (Integer)this.sessionFactory.getCurrentSession().save(u);
		int status2 = (Integer)this.sessionFactory.getCurrentSession().save(l);
		return status2;
		
	}
	
	public List<Login> userLogin(Login l) {
		
		String q = "from Login where username = :user and password = :passw";
		Query query = this.sessionFactory.getCurrentSession().createQuery(q);
		query.setParameter("user", l.getUsername());
		query.setParameter("passw", l.getPassword());
		List<Login> result = query.list();
		return result;
	}
	
	public int addProduct(Product p) {
		int status1 = (Integer)this.sessionFactory.getCurrentSession().save(p);
		return status1;		
	}
	
	public List<Product> viewProducts() {		
		String q = "from Product";
		Query query = this.sessionFactory.getCurrentSession().createQuery(q);
		List<Product> result = query.list();
		return result;
	}
	
	public int deleteProduct(int id) {
		int status = 0;
		String q = "delete from Product where pid = '"+id+"' ";
		Query query = this.sessionFactory.getCurrentSession().createQuery(q);
		status = query.executeUpdate();
		return status;
	}
	
	public Product editProductById(int id) {
		String q = "from Product where pid = '"+id+"' ";
		Query query = this.sessionFactory.getCurrentSession().createQuery(q);
		List<Product> result = query.list();
		Product ob = result.get(0);
		return ob;
	}
	
	public int updateProduct(Product p) {
		int status = 0;
		String q = "update Product set prod_name = :pname, price= :price, quantity = :qty where pid = :pid";
		Query query = this.sessionFactory.getCurrentSession().createQuery(q);
		query.setParameter("pname",p.getProd_name());
		query.setParameter("price", p.getPrice());
		query.setParameter("qty", p.getQuantity());
		query.setParameter("pid", p.getPid());
		status = query.executeUpdate();
		return status;
	}
	
	public int addToCart(Cart c) {
		int status1 = (Integer)this.sessionFactory.getCurrentSession().save(c);
		return status1;		
	}
	
	public List<Cart> cartView(int id){
		String q = "from Cart where user_id = '"+id+"' ";
		Query query = this.sessionFactory.getCurrentSession().createQuery(q);
		List<Cart> result = query.list();
		return result;
		
	}
	
	public void removeCartItem(int uid,int pid) {
		String q = "delete from Cart where user_id = '"+uid+"' and product_id= '"+pid+"' ";
		Query query = this.sessionFactory.getCurrentSession().createQuery(q);
		query.executeUpdate();
	}
	
}
