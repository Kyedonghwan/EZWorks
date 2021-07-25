package com.it.ez.message.model;

import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MessageSendListVO {
	private List<MessageSendVO> sMessage;
	private List<MessageReceiveVO> rMessage;
}
