package com.ptu.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ptu.pojo.Catelog;
import com.ptu.pojo.Goods;
import com.ptu.pojo.Orders;
import com.ptu.pojo.Purse;
import com.ptu.pojo.User;
import com.ptu.service.CatelogService;
import com.ptu.service.GoodsService;
import com.ptu.service.OrdersService;
import com.ptu.service.PurseService;
import com.ptu.service.UserService;

@Controller
@RequestMapping(value="/orders")
public class OrdersController {
	
	@Resource
	private OrdersService ordersService;
	@Resource
	private GoodsService goodsService;
	@Resource
	private PurseService  purseService;
	@Autowired
	private CatelogService catelogService;
	@Autowired
	private UserService userService;
    ModelAndView mv = new ModelAndView();
	

    @RequestMapping(value = "/myOrders")
    public ModelAndView orders(HttpServletRequest request) {
        User cur_user = (User)request.getSession().getAttribute("cur_user");
        Integer user_id = cur_user.getId();
        List<Orders> ordersList1=new ArrayList<Orders>();
        List<Orders> ordersList2=new ArrayList<Orders>();
        ordersList1 = ordersService.getOrdersByUserId(user_id);
        ordersList2 = ordersService.getOrdersByUserAndGoods(user_id);
        Purse myPurse=purseService.getPurseByUserId(user_id);
        List<User> users = userService.getUserOrderByDate(5);
    	mv.addObject("users", users);
        mv.addObject("ordersOfSell",ordersList2);
        mv.addObject("orders",ordersList1);
        mv.addObject("myPurse",myPurse);
        mv.setViewName("/user/orders");
        return mv;
    }
    
	 /**
     * 提交订单
     */
    @RequestMapping(value = "/addOrders")
    public String addorders(HttpServletRequest request,Orders orders) {
    	Date d=new Date();//获取时间
    	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");//转换格式
        User cur_user = (User)request.getSession().getAttribute("cur_user");
        Integer user_id = cur_user.getId();
        orders.setUserId(user_id);
        orders.setOrderDate(sdf.format(d));
        Goods goods=new Goods();
        goods.setStatus(0);
        goods.setId(orders.getGoodsId());
        Goods ngoods=goodsService.getGoodsByPrimaryKey(orders.getGoodsId());
        User nuser=userService.getUserById(ngoods.getUserId());
        int number = nuser.getGoodsNum();
		Integer calelog_id = ngoods.getCatelogId();
        //分类
		Catelog catelog = catelogService.selectByPrimaryKey(calelog_id);
		catelogService.updateCatelogNum(calelog_id, catelog.getNumber() - 1);
		userService.updateGoodsNum(nuser.getId(), number - 1);
        goodsService.updateGoodsByGoodsId(goods);//更新商品状态为0
        ordersService.addOrders(orders);
        Float balance=orders.getOrderPrice();
//        purseService.updatePurseOfdel(user_id,balance);
        return "redirect:/orders/myOrders";
    }
    
    /**
     * 发货 根据订单号
     */
    @RequestMapping(value = "/deliver/{orderNum}")
    public String deliver(HttpServletRequest request,@PathVariable("orderNum")Integer orderNum) {
    	ordersService.deliverByOrderNum(orderNum);
        return "redirect:/orders/myOrders";
    }
    
    /**
     * 收货
     */
    @RequestMapping(value = "/receipt")
    public String receipt(HttpServletRequest request) {
    Integer orderNum=Integer.parseInt(request.getParameter("orderNum"));
    	Float balance=Float.parseFloat(request.getParameter("orderPrice"));
    	Integer goodsId=Integer.parseInt(request.getParameter("goodsId"));
    	Integer userId=goodsService.getGoodsById(goodsId).getUserId();
    	ordersService.receiptByOrderNum(orderNum);
//    	purseService.updatePurseByuserId(userId,balance);
    	/*买家确认收货后，卖家钱包+*/
        return "redirect:/orders/myOrders";
    }

}
