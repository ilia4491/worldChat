package com.epam.worldchat.entity;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Address {

	private int id;
	private String country;
	private String city;
	private String area;
	private String street;
	private int home;
	private int floor;
	private int flat;
}
