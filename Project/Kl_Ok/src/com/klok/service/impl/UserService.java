package com.klok.service.impl;

import java.util.List;

import com.klok.base.service.BaseService;
import com.klok.entity.User;
import com.klok.service.IUserService;

public class UserService extends BaseService implements IUserService {

	@Override
	public User getUserByName(String name) {
		// TODO Auto-generated method stub
		return (User) this.getUserDAO().findByUname(name).get(0);
	}

	@Override
	public int login(User user) {
		// TODO Auto-generated method stub
		List<User> list=this.getUserDAO().findByUname(user.getUname());
		if(list.size()==1&&!list.get(0).getUpwd().equals(user.getUpwd()))
			return 0;//�������
		else if(list.size()==1&&list.get(0).getUpwd().equals(user.getUpwd())){
			if(list.get(0).getAflag())
				return 2;//����Ա
			else
				return 1;//��½�ɹ�
		}
		else
			return -1;//δ֪����
	}
	
}
