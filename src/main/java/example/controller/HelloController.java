package example.controller;

import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import example.model.UserDAO;
import example.pojo.Cart;
import example.pojo.Login;
import example.pojo.Product;
import example.pojo.User;


@Controller
@ComponentScan("example.model")
public class HelloController {
	
	@Autowired
	UserDAO dao;
	
	@RequestMapping("/")
	public String home(Model m) {
		m.addAttribute("login",new Login());
		m.addAttribute("user",new User());
		return "index";		
	}
	
	@RequestMapping("/home")
	public String index(Model m) {
		m.addAttribute("login",new Login());
		m.addAttribute("user",new User());
		return "index";		
	}
	
	@RequestMapping("/saveUser")
	public String saveUserInfo(@ModelAttribute("login")Login l, @ModelAttribute("user")User u) {
		dao.saveData(l, u);
		return "index";
	}
	
	@RequestMapping("/userLogin")
	public String UserLogin(@ModelAttribute("login")Login l, HttpSession session) {
		List<Login> i = dao.userLogin(l);	
		
		Iterator itr = i.iterator();
		if(itr.hasNext()){
			Login u = i.get(0);
			session.setAttribute("userob", u.getUser());
			if(u.getUsername().equals("admin") && u.getPassword().equals("admin")) {
				return "productForm";
			}
			else{
				return "redirect:/viewProducts";		
			}
		}	
		return "index";		
	}

	
	
	@RequestMapping("/addProduct")
	public String addProduct(Model m) {
		m.addAttribute("prod",new Product());
		return "redirect:/addProd";
		
	}
	
	@RequestMapping("/addProd")
	public String addProd(@ModelAttribute("prod")Product p) {
		dao.addProduct(p);
		return "productForm";
		
	}
	
	@RequestMapping("/viewProducts")
	public String viewProducts(Model m) {
		List<Product> prod_list = dao.viewProducts();
		m.addAttribute("prod_list",prod_list);
		return "userViewPage";	
	}
	
	@RequestMapping("/adminView")
	public String viewProduct(Model m) {
		List<Product> prod_list = dao.viewProducts();
		m.addAttribute("prod_list",prod_list);
		return "adminViewPage";	
	}
	
	@RequestMapping(value="/deleteProduct/{id}",method=RequestMethod.GET)
	public String deleteProduct(@PathVariable int id) {
		int status = dao.deleteProduct(id);
		return "redirect:/adminView";
	}
	
	@RequestMapping(value="/editProduct/{id}")
	public String edit(@PathVariable int id,Model m) {
		Product p = dao.editProductById(id);		
//		Product p = list.get(0);
		m.addAttribute("p",p);
		return "updateForm";
	}
	
	@RequestMapping(value="/saveUpdate")
	public String saveUpdate(@ModelAttribute("p")Product p) {
		dao.updateProduct(p);
		return "redirect:/adminView";
	}
	
	@RequestMapping(value="/addToCart/{id}")
	public String addToCart(HttpSession session,@PathVariable int id,Model m) {
		User user = (User) session.getAttribute("userob");
		Product pob = dao.editProductById(id);
		Cart cart = new Cart();
		cart.setUser(user);
		cart.setProduct(pob);
		dao.addToCart(cart);
		return "redirect:/viewCart";
	}
	
	@RequestMapping("/viewCart")
	public String viewCart(HttpSession session,Model m) {
		User user = (User) session.getAttribute("userob");
		List<Cart> cart = dao.cartView(user.getUid());
		m.addAttribute("cart",cart);
		return "cart";
	}
	
	/*@RequestMapping("/cart")
	public String cart() {
		return "redirect:/viewCart";
	}*/
	
	@RequestMapping("/removeItem/{id}")
	public String removeItem(HttpSession session,@PathVariable int id) {
		User user = (User) session.getAttribute("userob");
		int uid = user.getUid();
		dao.removeCartItem(uid, id);
		return "redirect:/viewCart";
	}
}
