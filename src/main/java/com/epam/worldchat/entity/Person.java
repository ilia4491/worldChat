package com.epam.worldchat.entity;

import java.util.List;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Person {

	private int id;
	private String firstName;
	private String lastName;
	private int age;
	private Sex sex;
	private List<Place> personPlaces;
	private List<Place> activePlaces;
	
}
