# frozen_string_literal: true
# name: discourse-onebox-xinhuanet
# about: For generating pretty oneboxes for xinhuanet.com
# version: 0.1
# authors: dengzi
# https://www.zcool.com.cn/work/ZNDIzMzcxMzI=.html

Onebox = Onebox

module Onebox
	module Engine
		class HuanqiuOnebox
			include Engine
			include HTML

			# matches_regexp(/^(http?:\/\/)?(www\.)?zcool\.com\.cn\/?.*\/?$/)
			matches_regexp(/^(http?:\/\/)?(.+)?zcool\.com\.cn\/?.*\/?$/)

			def get_logo_url
				'https://static.zcool.cn/git_z/z/common/images/svg/logo.svg'
			end


			def to_html
				result ={
					url: @url,
					image: get_logo_url,
					title: raw.css('title').text.gsub('\n', '').strip(),
					description: raw.css('meta[name=description]').first['content']
				}
				<<-HTML
				<aside class="onebox xinhuanet">
				<header class="source">
				<a href="#{@url}">站酷</a>
				</header>
				<article class="onebox-body">
				<h3>
				<a href="#{@url}" target="_blank" rel="nofollow ugc noopener">
				#{result[:title]}
				</a>
				</h3>
				<p>#{result[:description]}</p>
				</article>
				</aside>
				HTML
			end
		end
	end
end
