package secondHandMarket;


import java.util.List;

import javax.annotation.Resource;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ptu.pojo.Goods;
import com.ptu.pojo.Orders;
import com.ptu.pojo.Purse;
import com.ptu.pojo.User;
import com.ptu.service.AdminService;
import com.ptu.service.GoodsService;
import com.ptu.service.OrdersService;
import com.ptu.service.PurseService;
import com.ptu.service.UserService;



@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:conf/applicationContext.xml"})
public class secondHandMarketTest {
		@Resource
		private UserService userService;
		
		@Resource
		private GoodsService goodsService;

		@Resource
		private OrdersService ordersService;

		@Resource
		private PurseService purseService;

		@Resource
		private AdminService adminService;

		@Before
		public void beforeTest() {
			System.out.println("测试-star");
		}
		
		@Test
		public void TestUsers() {
			List<User> rows = userService.getPageUser(1, 10);
			System.out.println("用户："+rows);
		}
		
		@Test
		public void TestGoods() {
			List<Goods> rows = goodsService.getAllGoods();
			System.out.println("商品："+rows);
		}
		
		@Test
		public void TestOrders() {
			List<Orders> rows = ordersService.getPageOrders(1, 10);
			System.out.println("订单："+rows);
		}
		
		@Test
		public void TestPurse() {
			List<Purse> rows = purseService.getPagePurse(1, 10);
			System.out.println("钱包："+rows);
		}

		@After
		public void afterTest() {
			System.out.println("测试-end");
		}

		

	}
