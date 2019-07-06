package com.epam.worldchat.entity;

import java.time.LocalDate;
import java.util.List;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Chat {

	private long id;
	private LocalDate creationDate;
	private List<Comment> comments;
	
}
