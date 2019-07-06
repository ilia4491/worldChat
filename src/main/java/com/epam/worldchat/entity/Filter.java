package com.epam.worldchat.entity;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Filter {

	private int id;
	private int ageFrom;
	private int ageTo;
	private Sex sex;
	private Place PlaceFrom;
	private Place PlaceTo;

}
