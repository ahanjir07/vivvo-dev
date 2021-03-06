<vte:template>
	<vte:header type="script" href="{VIVVO_URL}js/form_builder.js" />
	<vte:header type="script" href="{VIVVO_URL}js/framework/effects.js" />
	<vte:header type="script" href="{VIVVO_URL}js/framework/builder.js" />
	<vte:header type="script" href="{VIVVO_URL}js/tooltips.js" />
	<vte:header type="css" href="{VIVVO_THEME}css/plugin_form_builder.css" />
	<div class="box box_form">
		<div class="box_title_holder"><div class="box_title"><vte:value select="{form.title}" /></div></div>
		<div class="box_body">
			<div class="box_content">
				<form method="post" action="{form.message_url}">
					<vte:attribute name="enctype">
						<vte:if test="{form_has_file_upload}">multipart/form-data</vte:if>
					</vte:attribute>
					<vte:attribute name="class">
						<vte:if test="{form_has_file_upload}">noajax </vte:if>form_builder
					</vte:attribute>
					<vte:attribute name="action">
						<vte:if test="{form_has_file_upload}"><vte:value select="{VIVVO_PROXY_URL}" /><vte:value select="{form.url}" /><vte:else><vte:value select="{form.message_url}" /></vte:else></vte:if>
					</vte:attribute>
					<input type="hidden" name="PFB_form_id" value="{form.id}" />
					<input type="hidden" name="action" value="{form.action}" />
					<input type="hidden" name="cmd" value="{form.cmd}" />
					<div class="error_message" style="display:none;"> </div>
					<vte:foreach from="{form_elements}" item="form_element">
						<vte:if test="{form_element.type} = 'text'">
							<div class="form_line">
								<p><vte:value select="{form_element.label}" /></p>
							</div>
						</vte:if>
						<vte:if test="{form_element.type} = 'heading'">
							<div class="form_line">
								<strong><vte:value select="{form_element.label}" /></strong>
							</div>
						</vte:if>
						<vte:if test="{form_element.type} = 'input'">
							<div class="form_line" title="{form_element.error_message}">
								<label>
									<vte:attribute name="class"><vte:if test="{form_element.required}">required</vte:if></vte:attribute>
									<vte:value select="{form_element.label}" />
								</label>
								<div class="formElement" title="{form_element.reg_exp}">
									<input class="form_builder_text" type="text" name="PFB_{form_element.name}" value="{form_element.selected}">
										<vte:attribute name="class"><vte:if test="!{form_element.size}">form_builder_text</vte:if></vte:attribute>
										<vte:attribute name="size"><vte:if test="{form_element.size}"><vte:value select="{form_element.size}" /></vte:if></vte:attribute>
										<vte:attribute name="maxlength"><vte:if test="{form_element.max_size}"><vte:value select="{form_element.max_size}" /></vte:if></vte:attribute>
									</input>
									<vte:if test="{form_element.description}">
										<img class="info_help" src="{VIVVO_THEME}img/icon_pref_help.gif" title="{form_element.description}" />
									</vte:if>
								</div>
							</div>
						</vte:if>
						<vte:if test="{form_element.type} = 'file_upload'">
							<div class="form_line" title="{form_element.error_message}">
								<label>
									<vte:attribute name="class"><vte:if test="{form_element.required}">required</vte:if></vte:attribute>
									<vte:value select="{form_element.label}" />
								</label>
								<div class="formElement">
									<input class="form_builder_file_upload" type="file" name="PFB_{form_element.name}" value="" />
									<vte:if test="{form_element.description}">
										<img class="info_help" src="{VIVVO_THEME}img/icon_pref_help.gif" title="{form_element.description}" />
									</vte:if>
								</div>
							</div>
						</vte:if>
						<vte:if test="{form_element.type} = 'textarea'">
							<div class="form_line" title="{form_element.error_message}">
								<label>
									<vte:attribute name="class"><vte:if test="{form_element.required}">required</vte:if></vte:attribute>
									<vte:value select="{form_element.label}" />
								</label>
								<div class="formElement" title="{form_element.reg_exp}">
									<textarea class="form_builder_textarea" cols="{form_element.size}" rows="{form_element.max_size}" name="PFB_{form_element.name}"><vte:attribute name="rows"><vte:if test="{form_element.max_size}"><vte:value select="{form_element.max_size}" /><vte:else>3</vte:else></vte:if></vte:attribute><vte:value select="{form_element.selected}" /></textarea>
									<vte:if test="{form_element.description}">
										<img class="info_help" src="{VIVVO_THEME}img/icon_pref_help.gif" title="{form_element.description}" />
									</vte:if>
								</div>
							</div>
						</vte:if>
						<vte:if test="{form_element.type} = 'submit'">
							<div class="form_line">
								<label> </label>
								<div class="formElement">
									<input type="submit" name="PFB_{form_element.name}" value="{form_element.label}" />
								</div>
							</div>
						</vte:if>
						<vte:if test="{form_element.type} = 'checkbox'">
							<div class="form_line" title="{form_element.error_message}">
								<label>
									<vte:attribute name="class"><vte:if test="{form_element.required}">required</vte:if></vte:attribute>
									<vte:value select="{form_element.label}" />
								</label>
								<div class="formElement checkbox">
									<label>
										<input type="checkbox" name="PFB_{form_element.name}">
											<vte:attribute name="checked"><vte:if test="{form_element.selected}">checked</vte:if></vte:attribute>
										</input>
										<vte:value select="{form_element.options}" />
									</label>
									<vte:if test="{form_element.description}">
										<img class="info_help" src="{VIVVO_THEME}img/icon_pref_help.gif" title="{form_element.description}" />
									</vte:if>
								</div>
							</div>
						</vte:if>
						<vte:if test="{form_element.type} = 'drop_down'">
							<div class="form_line" title="{form_element.error_message}">
								<label>
									<vte:attribute name="class"><vte:if test="{form_element.required}">required</vte:if></vte:attribute>
									<vte:value select="{form_element.label}" />
								</label>
								<div class="formElement">
									<select class="form_builder_options" name="PFB_{form_element.name}" size="{form_element.size}">
										<vte:foreach from="{form_element.get_options}" item="option">
											<option value="{option}">
												<vte:attribute name="selected"><vte:if test="{option} = {form_element.selected}">selected</vte:if></vte:attribute>
												<vte:value select="{option}" />
											</option>
										</vte:foreach>
									</select>
									<vte:if test="{form_element.description}">
										<img class="info_help" src="{VIVVO_THEME}img/icon_pref_help.gif" title="{form_element.description}" />
									</vte:if>
								</div>
							</div>
						</vte:if>
						<vte:if test="{form_element.type} = 'radio'">
							<div class="form_line" title="{form_element.error_message}">
								<label>
									<vte:attribute name="class"><vte:if test="{form_element.required}">required</vte:if></vte:attribute>
									<vte:value select="{form_element.label}" />
								</label>
								<div class="formElement radio">
									<vte:foreach from="{form_element.get_options}" item="option">
										<label>
											<input type="radio" value="{option}" name="PFB_{form_element.name}">
												<vte:attribute name="checked"><vte:if test="{option} = {form_element.selected}">checked</vte:if></vte:attribute>
											</input>
											<vte:value select="{option}" />
										</label>
									</vte:foreach>
									<vte:if test="{form_element.description}">
										<img class="info_help" src="{VIVVO_THEME}img/icon_pref_help.gif" title="{form_element.description}" />
									</vte:if>
								</div>
							</div>
						</vte:if>
					</vte:foreach>
				</form>
			</div>
		</div>
	</div>
</vte:template>
