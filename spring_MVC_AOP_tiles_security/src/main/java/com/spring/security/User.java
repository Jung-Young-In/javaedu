package com.spring.security;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.spring.dto.MemberVO;

//이 클래스는 껍데기고 내용은 MemberVO의 내용이 나가게 됨
public class User implements UserDetails {

	private MemberVO member;
	
	public User(MemberVO member) {
		this.member = member;
	}
	
	//user의 권한을 부여해주는 메서드
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {

		List<GrantedAuthority> roles = new ArrayList<GrantedAuthority>();
		
		roles.add(new SimpleGrantedAuthority(member.getAuthority()));
		
		return roles;
	}

	@Override
	public String getPassword() {
		return member.getPwd();
	}

	@Override
	public String getUsername() {
		return member.getId();
	}

	//기간제 계정의 경우 기간만료 여부 : enabled=4(기간만료)
	//만약 기간만료에 대한 설정이 없는 경우라면 return을 true로 두게 되면 됨
	@Override
	public boolean isAccountNonExpired() {
		return member.getEnabled()!=4;
	}

	//사용 정지 혹은 휴면계정의 경우 : enabled=3
	@Override
	public boolean isAccountNonLocked() {
		return member.getEnabled()!=3;
	}

	//인증정보 만료 여부 : enabled=2
	@Override
	public boolean isCredentialsNonExpired() {
		return member.getEnabled()!=2;
	}

	@Override
	public boolean isEnabled() {
		return member.getEnabled()==1;
	}
	
	public MemberVO getMemberVO() {
		return this.member;
	}
}
