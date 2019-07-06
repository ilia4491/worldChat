package com.epam.worldchat.entity;

import java.time.LocalDate;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Comment {

	private long id;
	private LocalDate date;
	private Person person;
	private String text;
}
