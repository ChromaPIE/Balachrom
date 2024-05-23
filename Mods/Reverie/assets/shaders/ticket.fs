#if defined(VERTEX) || __VERSION__ > 100 || defined(GL_FRAGMENT_PRECISION_HIGH)
	#define MY_HIGHP_OR_MEDIUMP highp
#else
	#define MY_HIGHP_OR_MEDIUMP mediump
#endif

extern MY_HIGHP_OR_MEDIUMP vec2 ticket;
extern MY_HIGHP_OR_MEDIUMP number dissolve;
extern MY_HIGHP_OR_MEDIUMP number time;
extern MY_HIGHP_OR_MEDIUMP vec4 texture_details;
extern MY_HIGHP_OR_MEDIUMP vec2 image_details;
extern bool shadow;
extern MY_HIGHP_OR_MEDIUMP vec4 burn_colour_1;
extern MY_HIGHP_OR_MEDIUMP vec4 burn_colour_2;

vec4 dissolve_mask(vec4 tex, vec2 texture_coords, vec2 uv)
{
    if (dissolve < 0.001) {
        return vec4(shadow ? vec3(0.,0.,0.) : tex.xyz, shadow ? tex.a*0.3: tex.a);
    }

    float adjusted_dissolve = (dissolve*dissolve*(3.-2.*dissolve))*1.02 - 0.01; //Adjusting 0.0-1.0 to fall to -0.1 - 1.1 scale so the mask does not pause at extreme values

	float t = time * 10.0 + 2003.;
	vec2 floored_uv = (floor((uv*texture_details.ba)))/max(texture_details.b, texture_details.a);
    vec2 uv_scaled_centered = (floored_uv - 0.5) * 2.3 * max(texture_details.b, texture_details.a);
	
	vec2 field_part1 = uv_scaled_centered + 50.*vec2(sin(-t / 143.6340), cos(-t / 99.4324));
	vec2 field_part2 = uv_scaled_centered + 50.*vec2(cos( t / 53.1532),  cos( t / 61.4532));
	vec2 field_part3 = uv_scaled_centered + 50.*vec2(sin(-t / 87.53218), sin(-t / 49.0000));

    float field = (1.+ (
        cos(length(field_part1) / 19.483) + sin(length(field_part2) / 33.155) * cos(field_part2.y / 15.73) +
        cos(length(field_part3) / 27.193) * sin(field_part3.x / 21.92) ))/2.;
    vec2 borders = vec2(0.2, 0.8);

    float res = (.5 + .5* cos( (adjusted_dissolve) / 82.612 + ( field + -.5 ) *3.14))
    - (floored_uv.x > borders.y ? (floored_uv.x - borders.y)*(5. + 5.*dissolve) : 0.)*(dissolve)
    - (floored_uv.y > borders.y ? (floored_uv.y - borders.y)*(5. + 5.*dissolve) : 0.)*(dissolve)
    - (floored_uv.x < borders.x ? (borders.x - floored_uv.x)*(5. + 5.*dissolve) : 0.)*(dissolve)
    - (floored_uv.y < borders.x ? (borders.x - floored_uv.y)*(5. + 5.*dissolve) : 0.)*(dissolve);

    if (tex.a > 0.01 && burn_colour_1.a > 0.01 && !shadow && res < adjusted_dissolve + 0.8*(0.5-abs(adjusted_dissolve-0.5)) && res > adjusted_dissolve) {
        if (!shadow && res < adjusted_dissolve + 0.5*(0.5-abs(adjusted_dissolve-0.5)) && res > adjusted_dissolve) {
            tex.rgba = burn_colour_1.rgba;
        } else if (burn_colour_2.a > 0.01) {
            tex.rgba = burn_colour_2.rgba;
        }
    }

    return vec4(shadow ? vec3(0.,0.,0.) : tex.xyz, res > adjusted_dissolve ? (shadow ? tex.a*0.3: tex.a) : .0);
}

vec4 effect( vec4 colour, Image texture, vec2 texture_coords, vec2 screen_coords )
{
    vec4 tex = Texel( texture, texture_coords);
    vec2 uv = (((texture_coords)*(image_details)) - texture_details.xy*texture_details.ba)/texture_details.ba;
    vec4 border_1 = vec4(255. / 255., 244. / 255., 180. / 255., 1.);
    vec4 border_2 = vec4(189. / 255., 188. / 255., 132. / 255., 1.);
    vec4 border_3 = vec4(171. / 255., 170. / 255., 120. / 255., 1.);
    vec4 joker_black = vec4(79. / 255., 99. / 255., 103. / 255., 1.);

    if (any(greaterThan(abs(tex.rgb - border_1.rgb), vec3(0.1))) &&
        any(greaterThan(abs(tex.rgb - border_2.rgb), vec3(0.1))) &&
        any(greaterThan(abs(tex.rgb - border_3.rgb), vec3(0.1))) &&
        any(greaterThan(abs(tex.rgb - joker_black.rgb), vec3(0.1))))
    {
        number low = min(tex.r, min(tex.g, tex.b));
        number high = max(tex.r, max(tex.g, tex.b));
        number delta = max(high-low, low*0.7);

        number fac = 0.8 + 0.9*sin(13.*uv.x+5.32*uv.y + ticket.r*12. + cos(ticket.r*5.3 + uv.y*4.2 - uv.x*4.));
        number fac2 = 0.5 + 0.5*sin(10.*uv.x+2.32*uv.y + ticket.r*5. - cos(ticket.r*2.3 + uv.x*8.2));
        number fac3 = 0.5 + 0.5*sin(12.*uv.x+6.32*uv.y + ticket.r*6.111 + sin(ticket.r*5.3 + uv.y*3.2));
        number fac4 = 0.5 + 0.5*sin(4.*uv.x+2.32*uv.y + ticket.r*8.111 + sin(ticket.r*1.3 + uv.y*13.2));
        number fac5 = sin(0.5*16.*uv.x+5.32*uv.y + ticket.r*12. + cos(ticket.r*5.3 + uv.y*4.2 - uv.x*4.));

        number maxfac = 0.6*max(max(fac, max(fac2, max(fac3,0.0))) + (fac+fac2+fac3*fac4), 0.);

        tex.rgb = tex.rgb*0.5 + vec3(0.4, 0.4, 0.8);

        tex.r = tex.r-delta + delta*maxfac*(0.7 + fac5*0.07) - 0.1;
        tex.g = tex.g-delta + delta*maxfac*(0.7 - fac5*0.17) - 0.1;
        tex.b = tex.b-delta + delta*maxfac*0.7 - 0.1;
        tex.a = tex.a*(0.8*max(min(1., max(0.,0.3*max(low*0.2, delta)+ min(max(maxfac*0.1,0.), 0.4)) ), 0.) + 0.15*maxfac*(0.1+delta));

        tex.a *= 0.6;
    }

    return dissolve_mask(tex*colour, texture_coords, uv);
}

extern MY_HIGHP_OR_MEDIUMP vec2 mouse_screen_pos;
extern MY_HIGHP_OR_MEDIUMP float hovering;
extern MY_HIGHP_OR_MEDIUMP float screen_scale;

#ifdef VERTEX
vec4 position( mat4 transform_projection, vec4 vertex_position )
{
    if (hovering <= 0.){
        return transform_projection * vertex_position;
    }
    float mid_dist = length(vertex_position.xy - 0.5*love_ScreenSize.xy)/length(love_ScreenSize.xy);
    vec2 mouse_offset = (vertex_position.xy - mouse_screen_pos.xy)/screen_scale;
    float scale = 0.2*(-0.03 - 0.3*max(0., 0.3-mid_dist))
                *hovering*(length(mouse_offset)*length(mouse_offset))/(2. -mid_dist);

    return transform_projection * vertex_position + vec4(0,0,0,scale);
}
#endif