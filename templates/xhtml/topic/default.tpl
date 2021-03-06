<html xmlns="http://www.w3.org/1999/xhtml" lang="{VIVVO_LANG_CODE}" xml:lang="{VIVVO_LANG_CODE}">
	<vte:include file="{VIVVO_TEMPLATE_DIR}system/html_header.tpl" />
	<body id="layout_two_column">
		<div id="container">
			<vte:include file="{VIVVO_TEMPLATE_DIR}box/header.tpl" />
            <div class="page_top"> </div>
			<div id="content">
				<div id="dynamic_box_center">
					<div id="box_center_holder">
						<div id="label_holder">
							<h1 class="page_title"><vte:value select="{topic.get_name}" /></h1>
							<ul>
								<vte:foreach from="{topic.get_tags}" item="label">
									<li><a href="{label.get_href}"><vte:value select="{label.get_name}" /></a></li>
								</vte:foreach>
							</ul>
						</div>
					</div>
				</div>
				<div id="dynamic_box_right">
					<div id="box_right_holder">
						<vte:include file="{VIVVO_TEMPLATE_DIR}{VIVVO_LOGIN_TEMPLATE}" nocache="1" />
                        <vte:include file="{VIVVO_TEMPLATE_DIR}box/popular_box.tpl" />
						<vte:include file="{VIVVO_TEMPLATE_DIR}box/featured_author.tpl" />
                        <vte:include file="{VIVVO_TEMPLATE_DIR}box/tag_cloud.tpl" />
					</div>
				</div>
			</div>
			<div id="footer">
				<vte:include file="{VIVVO_TEMPLATE_DIR}box/footer.tpl" />
			</div>
		</div>
	</body>
</html>
