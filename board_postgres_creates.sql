CREATE TABLE "BOARD" (
	"id" serial NOT NULL,
	"name" serial(255) NOT NULL,
	"user_id" VARCHAR(255) NOT NULL,
	"is_public" BOOLEAN NOT NULL,
	"type" VARCHAR(255) NOT NULL,
	"tab_order" integer NOT NULL,
	"name_is_editable" BOOLEAN NOT NULL DEFAULT 'true',
	"is_deletable" BOOLEAN NOT NULL DEFAULT 'false',
	"parent_board_id" integer,
	"public_info_id" integer NOT NULL,
	CONSTRAINT BOARD_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "BOARD_LAYOUT" (
	"id" serial NOT NULL,
	"board_id" serial NOT NULL,
	"can_add_widgets" BOOLEAN NOT NULL DEFAULT 'true',
	"can_remove_widgets" BOOLEAN NOT NULL DEFAULT 'false',
	"can_move_widgets" BOOLEAN NOT NULL DEFAULT 'true',
	"can_resize_widgets" BOOLEAN NOT NULL DEFAULT 'true',
	"can_manage_global_selectors" BOOLEAN NOT NULL DEFAULT 'true',
	CONSTRAINT BOARD_LAYOUT_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "BOARD_PAGE" (
	"id" serial NOT NULL,
	"board_id" serial NOT NULL,
	"web_component_id" integer NOT NULL,
	"configuration_id" integer NOT NULL,
	CONSTRAINT BOARD_PAGE_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "PUBLIC_INFO" (
	"id" serial NOT NULL,
	"information" TEXT NOT NULL,
	"contacts" TEXT NOT NULL,
	"sources" TEXT NOT NULL,
	"tags" TEXT NOT NULL,
	CONSTRAINT PUBLIC_INFO_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "CONFIGURATION" (
	"id" serial NOT NULL,
	"configuration" TEXT NOT NULL,
	CONSTRAINT CONFIGURATION_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "WEB_COMPONENT" (
	"id" serial NOT NULL,
	"web_component" TEXT NOT NULL,
	"environment" TEXT NOT NULL,
	CONSTRAINT WEB_COMPONENT_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "WIDGET" (
	"id" serial NOT NULL,
	"public_info_id" integer NOT NULL,
	"name" VARCHAR(255) NOT NULL,
	"min_width" integer NOT NULL,
	"min_height" integer NOT NULL,
	"max_width" integer NOT NULL,
	"max_height" integer NOT NULL,
	"default_width" integer NOT NULL,
	"default_height" integer NOT NULL,
	"web_component_id" integer NOT NULL,
	"detail_board_id" integer,
	CONSTRAINT WIDGET_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "SELECTOR" (
	"id" serial NOT NULL,
	"name" VARCHAR(255) NOT NULL,
	"public_info_id" integer NOT NULL,
	"web_component_id" integer NOT NULL,
	"width" integer,
	CONSTRAINT SELECTOR_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "WIDGET_SELECTOR" (
	"id" serial NOT NULL,
	"widget_id" integer NOT NULL,
	"selector_id" integer NOT NULL,
	"order" integer,
	CONSTRAINT WIDGET_SELECTOR_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "BOARD_LAYOUT_WIDGET" (
	"id" serial NOT NULL,
	"board_layout_id" integer NOT NULL,
	"widget_id" integer NOT NULL,
	"width" integer NOT NULL,
	"height" integer NOT NULL,
	"x_position" integer NOT NULL,
	"y_position" integer NOT NULL,
	"configuration_id" integer,
	CONSTRAINT BOARD_LAYOUT_WIDGET_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "BOARD_LAYOUT_SELECTOR" (
	"id" serial NOT NULL,
	"board_layout_id" integer NOT NULL,
	"selector_id" integer NOT NULL,
	"order" integer NOT NULL,
	"configuration_id" integer NOT NULL,
	CONSTRAINT BOARD_LAYOUT_SELECTOR_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



ALTER TABLE "BOARD" ADD CONSTRAINT "BOARD_fk0" FOREIGN KEY ("parent_board_id") REFERENCES "BOARD"("id");
ALTER TABLE "BOARD" ADD CONSTRAINT "BOARD_fk1" FOREIGN KEY ("public_info_id") REFERENCES "PUBLIC_INFO"("id");

ALTER TABLE "BOARD_LAYOUT" ADD CONSTRAINT "BOARD_LAYOUT_fk0" FOREIGN KEY ("board_id") REFERENCES "BOARD"("id");

ALTER TABLE "BOARD_PAGE" ADD CONSTRAINT "BOARD_PAGE_fk0" FOREIGN KEY ("board_id") REFERENCES "BOARD"("id");
ALTER TABLE "BOARD_PAGE" ADD CONSTRAINT "BOARD_PAGE_fk1" FOREIGN KEY ("web_component_id") REFERENCES "WEB_COMPONENT"("id");
ALTER TABLE "BOARD_PAGE" ADD CONSTRAINT "BOARD_PAGE_fk2" FOREIGN KEY ("configuration_id") REFERENCES "CONFIGURATION"("id");




ALTER TABLE "WIDGET" ADD CONSTRAINT "WIDGET_fk0" FOREIGN KEY ("public_info_id") REFERENCES "PUBLIC_INFO"("id");
ALTER TABLE "WIDGET" ADD CONSTRAINT "WIDGET_fk1" FOREIGN KEY ("web_component_id") REFERENCES "WEB_COMPONENT"("id");
ALTER TABLE "WIDGET" ADD CONSTRAINT "WIDGET_fk2" FOREIGN KEY ("detail_board_id") REFERENCES "BOARD"("id");

ALTER TABLE "SELECTOR" ADD CONSTRAINT "SELECTOR_fk0" FOREIGN KEY ("public_info_id") REFERENCES "PUBLIC_INFO"("id");
ALTER TABLE "SELECTOR" ADD CONSTRAINT "SELECTOR_fk1" FOREIGN KEY ("web_component_id") REFERENCES "WEB_COMPONENT"("id");

ALTER TABLE "WIDGET_SELECTOR" ADD CONSTRAINT "WIDGET_SELECTOR_fk0" FOREIGN KEY ("widget_id") REFERENCES "WIDGET"("id");
ALTER TABLE "WIDGET_SELECTOR" ADD CONSTRAINT "WIDGET_SELECTOR_fk1" FOREIGN KEY ("selector_id") REFERENCES "SELECTOR"("id");

ALTER TABLE "BOARD_LAYOUT_WIDGET" ADD CONSTRAINT "BOARD_LAYOUT_WIDGET_fk0" FOREIGN KEY ("board_layout_id") REFERENCES "BOARD_LAYOUT"("id");
ALTER TABLE "BOARD_LAYOUT_WIDGET" ADD CONSTRAINT "BOARD_LAYOUT_WIDGET_fk1" FOREIGN KEY ("widget_id") REFERENCES "WIDGET"("id");
ALTER TABLE "BOARD_LAYOUT_WIDGET" ADD CONSTRAINT "BOARD_LAYOUT_WIDGET_fk2" FOREIGN KEY ("configuration_id") REFERENCES "CONFIGURATION"("id");

ALTER TABLE "BOARD_LAYOUT_SELECTOR" ADD CONSTRAINT "BOARD_LAYOUT_SELECTOR_fk0" FOREIGN KEY ("board_layout_id") REFERENCES "BOARD_LAYOUT"("id");
ALTER TABLE "BOARD_LAYOUT_SELECTOR" ADD CONSTRAINT "BOARD_LAYOUT_SELECTOR_fk1" FOREIGN KEY ("selector_id") REFERENCES "SELECTOR"("id");
ALTER TABLE "BOARD_LAYOUT_SELECTOR" ADD CONSTRAINT "BOARD_LAYOUT_SELECTOR_fk2" FOREIGN KEY ("configuration_id") REFERENCES "CONFIGURATION"("id");

