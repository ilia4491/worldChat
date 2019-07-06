package com.epam.worldchat.entity;

import java.time.LocalDate;
import java.util.List;
import java.util.Set;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Chat {

	private long id;
	private LocalDate creationDate;
	private Set<Comment> comments;
	private String chatName;
}
