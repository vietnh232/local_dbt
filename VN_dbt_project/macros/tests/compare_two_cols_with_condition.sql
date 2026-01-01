{% test compare_two_dates(model, date1, date2, operator) %}
{# This test checks that date1 is not operator (>, <=, = etc) in the given model #}
    select
        *
    from
        {{ model }} 
    where {{ date1 }} is not null and {{ date2 }} is not null
      and {{ date1 }} {{operator}} {{ date2 }}
{% endtest %}