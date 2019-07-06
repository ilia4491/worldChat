package com.epam.worldchat.entity;

import java.util.List;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Place {
	
	private int id;
	private Address address;
	private List<Person> persons;
	private List<Chat> chats;
	private Filter filterToSend;
	private Filter filterToGet;
	private Place ParentPlace;
	private Place ChildPlace;

}
