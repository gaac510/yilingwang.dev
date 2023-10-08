create table
  public.articles (
    id uuid not null default gen_random_uuid (),
    default_page text not null,
    title text not null,
    draft_content text null,
    content text null,
    is_published boolean null,
    created_at timestamp without time zone null,
    published_at timestamp without time zone null,
    last_updated_at timestamp without time zone null,
    constraint articles_primary_key primary key (id)
  ) tablespace pg_default;